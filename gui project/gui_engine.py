import serial
import serial.tools.list_ports


def find_available_ports():
    ports = serial.tools.list_ports.comports()
    return ports


def sendInfo(ser):
    try:
        while True:
            command = input()
            ser.write(command.encode())

    except serial.SerialException as se:
        print("Ошибка последовательного порта:", str(se))

    except KeyboardInterrupt:
        print('Цикл передачи прерван.')
        pass

    finally:
        if ser.is_open:
            ser.close()
            print("Последовательное соединение прервано.")


def getInfo(ser):
    lines = []
    try:
        while True:
            line = ser.readline().decode().strip()

            if line:
                lines.append(line)

    except serial.SerialException as se:
        lines.append("Ошибка последовательного порта: " + str(se))

    finally:
        if ser.is_open:
            ser.close()
            lines.append("Последовательное соединение прервано.")


def mainProc():
    baudrate = 9600
    try:
        ports = serial.tools.list_ports.comports()
        portPointer = next((p.device for p in ports), None)
        if portPointer is None:
            raise ValueError("COM-порты не найдены.")
        else:
            for port in ports:
                print(port.device)

        currPort = input()
        ser = serial.Serial(currPort, baudrate=baudrate, bytesize=8, parity='N', stopbits=1, timeout=1, xonxoff=False,
                            rtscts=False)

        match input():
            case "1":
                getInfo(ser)
            case "2":
                sendInfo(ser)
            case _:
                print('Выход из программы...')

    except ValueError as ve:
        print("Ошибка значения:", str(ve))

    except Exception as e:
        print("Ошибка:", str(e))