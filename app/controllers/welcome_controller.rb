class WelcomeController < ApplicationController
  def index
    @companies = Company.this_month
    @deals = Deal.this_month
    @people = Person.this_month
    @notes = Note.limit(3)
  end
end
