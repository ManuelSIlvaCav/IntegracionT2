class New < ApplicationRecord
  validates :subtitle, presence: true, length: {maximum: 200}
  validates :title, presence: true
  #has_many :comments, :dependent => :delete_all

  def truncar
    if body.length <= 500
      cuerpo
    else
      body.truncate(500, :separator => ' ') + "..."
    end
  end
end
