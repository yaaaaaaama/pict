class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :pic, PicUploader

  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

         #コールバックを受けた時にユーザーがすでに
         #アプリケーションの中で認知されているかどうかを判断するメソッド
         def self.find_for_google_oauth2(auth)
          user = User.where(email: auth.info.email).first
          #メール認証スキップ(@obj.saveで送信されるのでその前に必要)
          unless user

            user = User.create(name:     auth.info.name,
                               provider: auth.provider,
                               uid:      auth.uid,
                               email:    auth.info.email,
                               token:    auth.credentials.token,
                               password: Devise.friendly_token[0, 20])
          end
          user.skip_confirmation!
          user.save!
          user
         end
end
