# install pip
# (the least strange way, imho)

package "python-setuptools"

execute "install_pip" do
    command "easy_install pip"
    user "root"
end

# install requirements

execute "install_requirements" do
    cwd node[:home_folder]
    user "root"
    command "pip install -r #{node[:source_folder]}src/requirements.txt"
end

# write a config

file "#{node[:source_folder]}src/config.py" do
    content "halo = True"
    owner node[:app_user]
    group node[:app_user]
end

# run preparation

execute "prepare_things" do
    cwd "#{node[:source_folder]}src/"
    user node[:app_user]
    command "python prepare.py"
end

# test

execute "coolproject_hopeitruns" do
    cwd "#{node[:source_folder]}src/"
    user node[:app_user]
    command "python coolproject.py"
end
