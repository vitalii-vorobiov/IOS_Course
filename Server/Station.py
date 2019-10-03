class Station:
    def __init__(self, name, prices):
        self.name = name
        self.prices = prices

    def get_fuel(self, fuel_type):
        return  self.prices[fuel_type.value]