SERVER_SETTINGS = SERVER_SETTINGS or {}

SERVER_SETTINGS["database"] = {}
SERVER_SETTINGS["auth"] = {}

SERVER_SETTINGS["database"].host = "127.0.0.1"
SERVER_SETTINGS["database"].user = "root"
SERVER_SETTINGS["database"].password = "PASSWORD HERE"

SERVER_SETTINGS["auth"].server = "https://www.egerdnc.me/auth/index.php"
SERVER_SETTINGS["auth"].token = CHECK_TOKEN()
