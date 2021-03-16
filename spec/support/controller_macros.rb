module ControllerMacros
  def login_user
    before (:each) do 
      @reqiest.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user
    end
  end

end