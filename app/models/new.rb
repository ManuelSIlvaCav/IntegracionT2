class New < ApplicationRecord
  validates :subtitle, presence: true, length: {maximum: 200}
  validates :title, presence: true
  has_many :comments, :dependent => :delete_all

  def short_body
    if self.body.length <= 500
      self.body
    else
      self.body.truncate(500, :separator => ' ') + "..."
    end
  end
end
