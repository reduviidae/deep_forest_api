module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        begin
          token = cookies["X-Authorization"].split(".")[2]
          decoded_token = JsonWebToken.decode(token)
          if (current_user = User.find(decoded_token["user_id"]))
            current_user
          else
            reject_unauthorized_connection
          end
        rescue
          current_user
        end
      end
  end
end
