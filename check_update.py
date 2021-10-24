import urllib.request
import json
from datetime import datetime, timezone, timedelta

update_threshold = timedelta(days=1)
try:
    with urllib.request.urlopen("https://api.github.com/repos/rust-lang/docker-rust/branches/master") as url:
        data = json.loads(url.read().decode())
        last_commit_date_str = data['commit']['commit']['committer']['date']
        last_commit_date = datetime.strptime(last_commit_date_str, "%Y-%m-%dT%H:%M:%S%z")
        time_interval = datetime.now(timezone.utc) - last_commit_date
        print(int(time_interval < update_threshold))
except Exception as ex:
    print(ex)
