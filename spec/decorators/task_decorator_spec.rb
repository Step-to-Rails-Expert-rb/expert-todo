require "rails_helper"

describe TaskDecorator do
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
        task = build_stubbed(:task, :due_date)
        decorated_task = ActiveDecorator::Decorator.instance.decorate(task)
        expect(decorated_task.due_date_without_time).to eq(DateTime.now.strftime("%Y-%m-%d"))
      end
      
      after do
        Timecop.return
      end
    end
  end
end