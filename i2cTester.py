import time
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from AtlasI2C import (AtlasI2C)

def calibrateTC(actualTemp):
    calTemp = actualTemp

    tc1Address = 102
    tc2Address = 103

    tc1 = AtlasI2C()
    tc2 = AtlasI2C()

    tc1.set_i2c_address(tc1Address)
    tc2.set_i2c_address(tc2Address)

    print("> Resetting calibration..")

    tc1.write("cal,clear")
    tc2.write("cal,clear")

    print("> Calibration cleared..")

    time.sleep(1.5)

    print("> Calibrating to "+calTemp+"°C..")

    tc1.write("cal,"+calTemp)
    tc2.write("cal,"+calTemp)

    print("> Calibration complete.")
    return True


def returnTemp():
    tc1Address = 102
    tc2Address = 103

    tc1 = AtlasI2C()
    tc2 = AtlasI2C()

    tc1.set_i2c_address(tc1Address)
    tc2.set_i2c_address(tc2Address)

    time.sleep(1.5)

    tc1.write("R")
    tc2.write("R")

    time.sleep(1.5)

    tc1Response = tc1.get_response(raw_data=tc1.file_read.read(31))
    tc2Response = tc2.get_response(raw_data=tc2.file_read.read(31))

    tc1Reading = float((''.join(tc1.handle_raspi_glitch(tc1Response[1:])))[:6])
    tc2Reading = float((''.join(tc2.handle_raspi_glitch(tc2Response[1:])))[:6])

    return (tc1Reading, tc2Reading)


