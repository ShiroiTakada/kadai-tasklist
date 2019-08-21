module UsersHelper
    def gravatar_url(user, options = { size: 80 })
      gravator_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
       "https://secure.gravatar.com/avatar/
#{gravator_id}
?s=
#{size}
"
    end
end