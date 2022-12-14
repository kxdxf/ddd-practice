require_relative '../../src/sns/user_repository'

class UserService
  def exists?(user)
    user_repository.find_by_name(user.name).size != 0
  end

  private

  def user_repository
    @user_repository ||= UserRepository.new
  end
end
