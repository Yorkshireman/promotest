class TenPercentDiscount
  def apply total, *arg
    if total > 60.00
      total = ten_percent_off total
    end
    total
  end

  private

  def ten_percent_off total
    total -= total/10
  end
end