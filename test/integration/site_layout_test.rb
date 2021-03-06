require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "test links" do
    get root_path
    assert_template 'home/welcome'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", "https://www.facebook.com/groups/812762058783473/"
  end

end
