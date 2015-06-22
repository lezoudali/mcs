module SoftDeletable
  extend ActiveSupport::Concern

  def delete(mode: :soft)
    mode == :hard ? super() : self.update_attributes(deleted_at: DateTime.current)
  end

  def self.included(base)
    base.class_eval do
      scope :deleted, -> { where('deleted_at IS NOT NULL') }
      scope :not_deleted, -> { where('deleted_at IS NULL') }

      scope :destroyed, -> { where('deleted_at IS NOT NULL') }
      scope :not_destroyed, -> { where('deleted_at IS NULL') }
    end
  end

  def restore
    self.update(deleted_at: nil)
  end

  def deleted?
    !!deleted_at
  end

  alias_method :destroy, :delete
  alias_method :destroy!, :delete
  alias_method :delete!, :delete

end