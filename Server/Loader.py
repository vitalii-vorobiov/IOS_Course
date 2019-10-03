from bs4 import BeautifulSoup
import requests
import time
from enum import Enum, auto


class Status(Enum):
    UPDATED = auto()
    CACHED = auto()

class Loader:
    def __init__(self, url, timeout=5):
        self.url = url
        self.timeout = timeout
        self.last_update = -timeout
        self.data = {}

    def update(self):
        request = requests.get(self.url)
        if request.status_code != 200:
            return

        soup = BeautifulSoup(request.text, features="html.parser")
        table_container = soup.find("div", {"class": "widget widget-fuel"})
        for row in table_container.div.table.tbody.findAll("tr"):
            self.data[row.th.text] = [float(i.text) for i in row.findAll("td")]

    def get_data(self):
        status = Status.CACHED
        if time.time() - self.last_update > self.timeout:
            self.last_update = time.time()
            self.update()
            status = Status.UPDATED

        return self.data, status


class FuelDataLoader(Loader):
    def __init__(self, id, timeout=5):
        super().__init__("https://finance.i.ua/fuel/" + str(id), timeout)
