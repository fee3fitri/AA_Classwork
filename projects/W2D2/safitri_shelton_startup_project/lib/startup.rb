require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee, title)
        if !valid_title?(title)
            raise 'invalid title'
        end

        @employees << Employee.new(employee, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise 'have no enough funding!'
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salary = 0
        @employees.each do |employee|
            total_salary += @salaries[employee.title]
        end
        total_salary / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        other_startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.has_key?(title)
        end

        other_startup.employees.each { |employee| @employees << employee }

        other_startup.close
    end
end