from District import FuelType, District
from flask import Flask, jsonify, request, abort, Response

app = Flask(__name__)

district_list = [
    District(4, "Crimea"),
    District(5, "Vinnytska"),
    District(6, "Dnipropetrovska"),
    District(7, "Donetska"),
    District(8, "Zhytomyrska"),
    District(9, "Zakarpatska"),
    District(10, "Zaporizhska"),
    District(11, "Ivano-Frankivska"),
    District(12, "Kyivska"),
    District(13, "Kirovohradska"),
    District(14, "Luhanska"),
    District(15, "Lvivska"),
    District(16, "Mykolayivska"),
    District(17, "Odeska"),
    District(18, "Poltavska"),
    District(19, "Rivnenska"),
    District(20, "Sumska"),
    District(21, "Ternopilska"),
    District(22, "Harkivska"),
    District(23, "Hersonska"),
    District(24, "Hmelnytska"),
    District(25, "Cherkaska"),
    District(26, "Chernyhivska"),
    District(27, "Chernivetska"),
    District(28, "Volynska")
]


@app.route('/', methods=["GET"])
def list_districts():
    return jsonify({value.name: index for index, value in enumerate(district_list)})


@app.route('/<int:id>/', methods=["GET"])
def get_district(id):
    if id < 0 or id > len(district_list)-1:
        abort(404)
    return jsonify({ft.name: district_list[id].getJson(ft) for ft in FuelType})

if __name__ == '__main__':
    app.run(debug=True)
