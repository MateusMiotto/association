class DashboardService
  def initialize(user)
    @user = user
  end

  def generate_dashboard_data
    {
      active_people_pie_chart: active_people_pie_chart,
      total_debts: total_debts,
      total_payments: total_payments,
      balance: balance,
      last_debts: last_debts,
      last_payments: last_payments,
      my_people: my_people,
      top_person: top_person,
      bottom_person: bottom_person,
    }
  end

  private

  def active_people_pie_chart
    {
      active: Person.where(active: true).count,
      inactive: Person.where(active: false).count
    }
  end

  def total_debts
    active_people_ids = active_people_ids()
    Debt.where(person_id: active_people_ids).sum(:amount)
  end

  def total_payments
    active_people_ids = active_people_ids()
    Payment.where(person_id: active_people_ids).sum(:amount)
  end

  def balance
    total_payments - total_debts
  end

  def last_debts
    Debt.order(created_at: :desc).limit(10).pluck(:id, :amount)
  end

  def last_payments
    Payment.order(created_at: :desc).limit(10).pluck(:id, :amount)
  end

  def my_people
    Person.where(user: @user).order(:created_at).limit(10)
  end

  def top_person
    people_with_positive_balance.last
  end

  def bottom_person
    people_with_positive_balance.first
  end

  def people_with_positive_balance
    Person.all.select { |person| person.balance > 0 }.sort_by(&:balance)
  end

  def active_people_ids
    Person.where(active: true).pluck(:id)
  end
end
