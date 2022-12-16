require_relative '../../src/sns/user_repository'
require_relative '../../src/sns/user_service'

class UserApplicationService
  def register(name)
    user = User(id: nil, name: name)
    raise Exception('ユーザーは既に存在します。') if user_service.exists?(user)
    user_repository.save(user)
  end

  def get(id)
    target_id = UserId.new(id)
    user = user_repository.find_by_id(target_id)
    user.size != 0 ? user : nil
  end

  private

  def user_repository
    @user_repository ||= UserRepository.new
  end

  def user_service
    @user_service ||= UserService.new
  end
end
