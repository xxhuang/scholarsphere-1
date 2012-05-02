require 'spec_helper'

describe RoleMapper do
  before do
    @user = FactoryGirl.create(:user)
    Dil::LDAP.stubs(:groups_for_user).with(@user.login+',dc=psu,dc=edu').returns(["umg/up.dlt.gamma-ci", "umg/up.dlt.redmine"])
  end
  subject {::RoleMapper.roles(@user.login)}
  it { should == ["umg/up.dlt.gamma-ci", "umg/up.dlt.redmine"]}
end
