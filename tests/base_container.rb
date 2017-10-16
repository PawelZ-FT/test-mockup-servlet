control "servlet_container" do

  impact 1.0
  title "Checking container"
  desc "Checking..."


  describe file('/usr/local/tomcat/webapps') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'tomcat' }
    its('group') { should eq 'tomcat' }
  end

  inspec.command("find /usr/local/tomcat/webapps -type f").stdout.each_line do |filename|
    describe file(filename.chomp) do
      it { should be_file }
      it { should be_owned_by 'tomcat' }
      # its('mode') { should cmp '0644' }
      it { should be_readable.by_user('tomcat') }
      it { should_not be_writable.by('others') }
    end
  end

  
 end