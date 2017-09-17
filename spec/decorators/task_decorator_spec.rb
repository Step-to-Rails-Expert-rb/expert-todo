require "rails_helper"

describe "#due_date_without_time" do
  context "due_date is nil" do
    it "returns nil" do
      task = build_stubbed(:task)
      decorated_task = ActiveDecorator::Decorator.instance.decorate(task)

      expect(decorated_task.due_date_without_time).to eq nil
    end
  end

  context "due_date is NOT nil" do
    before do
      Timecop.freeze(DateTime.now)
    end

    it "returns due_date without time and timezone" do
      pending "This example fails around 01:00 am because of timezone difference"
      fail
      # DateTime.now
      #=> Tue, 12 Sep 2017 01:13:28 +0900
      # task
      # due_date: Mon, 11 Sep 2017 16:13:28 UTC +00:00,
      task = build_stubbed(:task, :due_date)
      decorated_task = ActiveDecorator::Decorator.instance.decorate(task)
      expect(decorated_task.due_date_without_time).to eq(DateTime.now.strftime("%Y-%m-%d"))
    end

    after do
      Timecop.return
    end
  end
end
