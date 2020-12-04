import requests
import json

config = {}
allowed_types = ["snapshot", "release"]


def load_confg():
    with open("conf.json", "r") as conf:
        global config
        config = json.load(conf)
        if config["server_type"] not in allowed_types:
            print("Unsupported server type. Supported types: {}".format(allowed_types))
            exit(1)


def get_version_info():
    load_confg()
    versions = requests.get(config["ver_man_url"]).json()
    version_id = versions["latest"][config["server_type"]]
    for r in versions["versions"]:
        if r["id"] == version_id:
            return version_id, r["url"]


def get_download_link():
    version_name, url = get_version_info()
    ver_info = requests.get(url).json()
    print("{} {}".format(version_name, ver_info["downloads"]["server"]["url"]))


def main():
    get_download_link()


if __name__ == "__main__":
    main()
