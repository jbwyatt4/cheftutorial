# install pip
# (the least strange way, imho)

package "python-setuptools"

execute "install_pip" do
    command "easy_install pip"
    user "root"
end

# install requirements

execute "install_requirements" do
    cwd "/home/vagrant/"
    user "root"
    command "pip install -r /home/vagrant/cheftutorial/src/requirements.txt"
end

# write a config

file "/home/vagrant/cheftutorial/src/config.py" do
    content "halo = True"
    owner "vagrant"
    group "vagrant"
end

# run preparation

execute "prepare_things" do
    cwd "/home/vagrant/cheftutorial/src/"
    user "vagrant"
    command "python prepare.py"
end

# test

execute "coolproject_hopeitruns" do
    cwd "/home/vagrant/cheftutorial/src/"
    user "vagrant"
    command "python coolproject.py"
end
