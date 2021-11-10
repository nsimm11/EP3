import os
import os.path
from os.path import abspath, dirname, join
from pathlib import Path
import sys
import datetime
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

from PySide2.QtGui import QGuiApplication, QIcon
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, QTimer, QUrl

import i2cTester


class MainWindow(QObject):
    def __init__(self, d):
        QObject.__init__(self)
        newPath = ""
        self.settings = {
            "Batch_ID": ["B1"],
            "Date": [""],
            "Notes": [""],
            "swLight": ["ON"],
            "start": datetime.datetime.now()}
        
        self.dataHolder = {
            "phase": "ambient",
            "time": 0,
            "temp1": 20,
            "temp2": 20
                           }
        
        self.data = pd.DataFrame()
        
        self.currentPhase = {"name": "ambient",
                             "startTime": datetime.datetime.now()}
        
        self.currentPhaseSettings = {"ambient": 0.5*60,
                              "open": 0.5*60,
                              "closed": 0.5*60}
    
    def createTempPlot(self):
        datalen = len(self.data["time"])
        basis = 50
        if datalen >= basis:
            dataDen = int(datalen/basis)
        else:
            dataDen = 1
        
        temp1 = self.data["temp1"][::dataDen]
        temp2 = self.data["temp2"][::dataDen]
        time = self.data["time"][::dataDen]
        
        plt.plot(time, temp1, label="TC 1", c="g")
        plt.plot(time, temp2, label="TC 2", c="b")
        plt.xlabel("Time [s]")
        plt.ylabel("Temperature [C]")
        plt.legend()
        plt.savefig("qml/pages/TempPlot.jpg")
        plt.close()
        return True
    
    def checkPhase(self):
        curTime = datetime.datetime.now()
        curDifference = (curTime - self.currentPhase["startTime"]).total_seconds()
        if curDifference >= self.currentPhaseSettings[self.currentPhase["name"]]:
            print("Current Phase: " + str(self.currentPhase["name"]))
            
            if self.currentPhase["name"] == "ambient" or self.currentPhase["name"] == "closed":
                self.currentPhase["name"] = "open"
                self.currentPhase["startTime"] = datetime.datetime.now()
            
            elif self.currentPhase["name"] == "open":
                print("check")
                self.currentPhase["name"] = "closed"
                self.currentPhase["startTime"] = datetime.datetime.now()
            print("changed Phase to: " + str(self.currentPhase["name"]))
        return ("Check")
            
                
    @Slot(str, result=bool)
    def forcePhase(self, s):
        if s == "ambient":
            self.currentPhase = {"name": s,
                                 "startTime": datetime.datetime.now()}
        if s == "closed":
            self.currentPhase = {"name": s,
                                 "startTime": datetime.datetime.now()}
        if s == "open":
            self.currentPhase = {"name": s,
                                 "startTime": datetime.datetime.now()}
        return s
    
    @Slot(int, result=int)
    def changePhaseSettings(self, i, s):
        currentPhaseSettings[s] = i*60
    
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

    @Slot(str, result=bool)
    def getBatchId(self, s):
        self.settings["Batch_ID"] = [s]
        return True
    
    @Slot(str, result=bool)
    def getDate(self, s):
        self.settings["Date"] = [s]
        return True
    
    @Slot(str, result=bool)
    def getNotes(self, s):
        self.settings["Notes"] = [s]
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
        newPath = "Test_Data/" + str(self.settings["Batch_ID"][0])
        i = 1
        while(os.path.exists(newPath)):
            newPath = newPath + str(i)
            i = i + 1
        os.mkdir(newPath)
        self.newPath = newPath[10:]
        Settings = pd.DataFrame.from_dict(self.settings)
        excel_name = "Test_Data/" + self.newPath + "/Settings.csv"
        Settings.to_csv(excel_name)
        return True

    @Slot(str, result=str)
    def getTemp1(self, s):
        temps = i2cTester.returnTemp()
        self.dataHolder["temp1"] = temps[0]
        return str(temps[0])
    
    @Slot(str, result=str)
    def getTemp2(self, s):
        temps = i2cTester.returnTemp()
        self.dataHolder["temp2"] = temps[1]
        return str(temps[1])
    
    @Slot(str, result=str)
    def getPhaseName(self, s):
        return self.currentPhase["name"]

    @Slot(str, result=str)
    def getPhaseTime(self, s):
        return str(np.round(np.abs(self.currentPhase["startTime"] - datetime.datetime.now()).total_seconds(),0)) + "/" + str(self.currentPhaseSettings[self.currentPhase["name"]])
    
    
    @Slot(str, result=str)
    def submitDataLine(self, s):
        
        currentPhase = self.checkPhase()
        
        curTime = (datetime.datetime.now() - self.settings["start"]).total_seconds()
        self.dataHolder["time"] = curTime
        self.dataHolder["phase"] = self.currentPhase
        self.data = self.data.append(self.dataHolder, ignore_index=True)
        if int(curTime) % 60 ==  0 or not os.path.isfile("qml/pages/TempPlot.jpg"):
            excel_name = "Test_Data/" + self.newPath + "/Data.csv"
            self.data.to_csv(excel_name)
            self.createTempPlot()
        return str(curTime)

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
