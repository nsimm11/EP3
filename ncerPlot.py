from PyQt5 import QtCore
import pandas as pd
from PySide2 import QtGui


class CustomModel(QtCore.QAbstractTableModel):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.column_count = 4
        self.row_count = 15
        data = pd.read_excel("ExampleNCERData.xlsx")
        self.data = data.to_numpy()
        print(self.data)

    def rowCount(self, parent):
        return len(self.data)

    def columnCount(self, parent):
        return self.column_count

    def data(self, index, role):
        if role == QtCore.Qt.DisplayRole:
            return self.data[index.row()][index.column()]
        elif role == QtCore.Qt.EditRole:
            return self.data[index.row()][index.column()]
        elif role == QtCore.Qt.BackgroundRole:
            return QtGui.QColor(QtCore.Qt.white)
        return QtCore.QVariant()
