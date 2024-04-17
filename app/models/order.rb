class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  attr_accessor :address, :city, :province_id
  validates :total, numericality: true

  def subtotal
    order_items.sum { |item| item.price * item.quantity }
  end

  # Calculate GST
  def calculate_gst
    if subtotal && user.province&.gst
      subtotal * (user.province.gst / 100.0)
    else
      0.0
    end
  end

  # Calculate PST
  def calculate_pst
    if subtotal && user.province&.pst
      subtotal * (user.province.pst / 100.0)
    else
      0.0
    end
  end

  # Calculate HST
  def calculate_hst
    if subtotal && user.province&.hst
      subtotal * (user.province.hst / 100.0)
    else
      0.0
    end
  end

  # Calculate total taxes
  def calculate_taxes
    calculate_gst + calculate_pst + calculate_hst
  end

  def total
    subtotal + calculate_taxes
  end
end
