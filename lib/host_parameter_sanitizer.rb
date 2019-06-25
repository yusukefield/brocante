class HostParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up,keys:[:group_name, :rep_name, :address, :phonenum])
  end

  def sign_up
    p default_params.require(:host).permit(:group_name, :rep_name, :address, :phonenum)
    default_params.require(:host).permit(:group_name, :rep_name, :address, :phonenum)
  end

  def initialize(*)
    super
    permit(:sign_in)
  end

  def sign_in
    default_params.require(:host)
  end
end