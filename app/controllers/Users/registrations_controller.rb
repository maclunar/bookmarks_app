class Users::RegistrationsController < Devise::RegistrationsController
  # layout false, only: [:new]

  # GET /resource/sign_up
  def new
    build_resource({})
    @validatable = devise_mapping.validatable?
    if @validatable
      @minimum_password_length = resource_class.password_length.min
    end
    respond_with self.resource, layout: (request.xhr? ? false : true)
  end
end
