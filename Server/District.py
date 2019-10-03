from Loader import FuelDataLoader, Status
from Station import Station
from enum import Enum, auto


class FuelType(Enum):
    A92 = 0
    A95 = 1
    DF = 2


class District:
    def __init__(self, id, name):
        self.id = id
        self.name = name
        self.stations = []
        self.loader = FuelDataLoader(id, timeout=(3 * 60 * 60))

    def getJson(self, fuel_type):
        retrieved_data, status = self.loader.get_data()
        if status == Status.UPDATED:
            self.stations = [Station(name, prices) for name, prices in retrieved_data.items()]

        return {
            "name": self.name,
            "prices": {i.name: i.get_fuel(fuel_type) for i in self.stations}
        }

