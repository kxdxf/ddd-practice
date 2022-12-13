require_relative '../../src/domain/user_repository'
require 'sqlite3'

class UserService
  def exists?(user)
    !repository.find(user.name).nil?
  end

  private

  def repository
    @repository ||= UserRepository.new
  end
end
