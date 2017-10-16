control "servlet_container" do

  impact 1.0
  title "Checking container"
  desc "Checking..."


  describe file('/container-entry.sh') do
  	it { should exist }
  	it { should be_file }
  	it { should be_owned_by 'root' }
  	its('group') { should eq 'root' }
  	its('mode') { should cmp '0755' }
  end
  
 end