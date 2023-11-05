def test_nginx(host):
    nginx = host.package("nginx")
    assert nginx.is_installed

    nginx = host.service("nginx")
    assert nginx.is_running
    assert nginx.is_enabled

    res = host.ansible("ansible.builtin.uri", "url=http://localhost return_content=true", check=False)
    assert res["status"] == 200
    assert res["content"] == "hello world\n"
