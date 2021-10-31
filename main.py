import os
import os.path
from os.path import abspath, dirname, join
from pathlib import Path
import sys
import datetime
import pandas as pd

from PySide2.QtGui import QGuiApplication, QIcon
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, QTimer, QUrl

#import i2cTester


class MainWindow(QObject):
    def __init__(self, data):
        QObject.__init__(self)
        self.settings = {
            "Batch_ID": ["B1"],
            "Date": [""],
            "Notes": [""],
            "swLight": ["ON"]}
        self.batchID = ""
        self.Date = ""
        self.Notes = ""
        self.data = data

    @Slot(list, result=bool)
    def getBold(self, s):
        if s[0] == s[1]:
            print(s[1])

            return True
        else:
            return False

    @Slot(list, result=str)
    def getOF(self, s):
        if s[1] == "OFF":
            self.settings[s[0]] = ["ON"]
            print(self.settings["swLight"])
            return "ON"
        else:
            print("OFF")
            self.settings[s[0]] = ["OFF"]
            return "OFF"

    @Slot(str, result=str)
    def getSubmit(self, s):
        print(s)
        return "SUBMIT"

    @Slot(list, result=bool)
    def getSubmitField(self, lst):
        if(lst[0] == "tfBatchID"):
            self.settings["Batch_ID"] = [lst[1]]
        elif(lst[0] == "tfDate"):
            self.settings["Date"] = [lst[1]]
        elif(lst[0] == "tfNotes"):
            self.settings["Notes"] = [lst[1]]
        else:
            print("failed")
            return False
        return True

    @Slot(str, result=str)
    def getValueWaveLength(self, s):
        val = int(float(s) * 300 ) + 400
        if val <= 400:
            print(val)
            return (str(400) + " nm")
        else:
            print(val)
            return (str(val) + " nm")

    @Slot(str, result=str)
    def getValueChillerTemp(self, s):
        val = int(float(s) * 30 ) + -5
        if val <= -5:
            print(val)
            return (str(-5) + " C")
        else:
            print(val)
            return (str(val) + " C")

    @Slot(str, result=str)
    def getValueHeaterTemp(self, s):
        val = int(float(s) * 100 ) + 20
        if val <= 20:
            print(val)
            return (str(30) + " C")
        else:
            print(val)
            return (str(val) + " C")

    @Slot(str, result=bool)
    def submitSettings(self, conf):
        Settings = pd.DataFrame.from_dict(self.settings)
        excel_name = "Test_Data/" + str(self.settings["Batch_ID"][0]) + ".xlsx"
        print(self.data)
        Settings.to_excel(excel_name, sheet_name = "Settings")
        return True

    @Slot(str, result=list)
    def getTemp(self, s):
        #temps = i2cTester.returnTemp()
        return [20.00, 25.00]

if __name__ == "__main__":

    data = pd.read_excel("ExampleNCERData.xlsx")

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    app.setWindowIcon(QIcon("images/ep-icon.png"))

    # Get Context -- Send/Recieve data from QML
    win = MainWindow(data)
    engine.rootContext().setContextProperty("win", win)

    # Set Additional App Info
    app.setOrganizationName("Jad/Noah")
    app.setOrganizationDomain("Savron")


    # Load Main QML File
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
