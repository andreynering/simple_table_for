require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test 'should render table' do
    get :index, template: :render

    assert_select 'table#the-id.the-class' do
      assert_select 'thead' do
        assert_select 'tr' do
          assert_select 'th'
        end
      end

      assert_select 'tbody' do
        assert_select 'tr' do
          assert_select 'td.title'
          assert_select 'td.text'
          assert_select 'td.link'
        end
      end
    end
  end

  test 'should render table with defaults (set in application.rb)' do
    get :index, template: :defaults

    assert_select 'table.default-class' do
      assert_select 'thead' do
        assert_select 'tr' do
          assert_select 'th'
        end
      end

      assert_select 'tbody' do
        assert_select 'tr' do
          assert_select 'td'
        end
      end
    end
  end
end
