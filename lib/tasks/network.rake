#
# These are Mac OsX development related
#
namespace :network do
  desc %Q{ ›› Toggle Web Proxy (HTTP) OFF }
  task :proxy_off do
    sh %{ networksetup -setwebproxystate Ethernet off }
  end
  
  desc %Q{ ›› Toggle Web Proxy (HTTP) ON }
  task :proxy_on do
    sh %{ networksetup -setwebproxy Ethernet 10.10.10.14 3128 }
  end
  
  desc %Q{ ›› Add *.localhost to Mac OsX Network Proxy Settings }
  task :configure_bypass_proxy do
    sh %{ networksetup -setproxybypassdomains Ethernet *.localhost, *.local, 169.254/16 }
  end
  
end
