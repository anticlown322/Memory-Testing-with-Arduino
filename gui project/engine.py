import serial
import serial.tools.list_ports

def fastPortsCheck():
    ports = serial.tools.list_ports.comports()
    print('Текущие доступные порты:')
    for port in ports:
        print(port.device)


def sendInfo(ser):
    try:
        print("Последовательное соединение установлено.")

        while True:
            command = input("Введите строку: ")

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
    try:
        print("Последовательное соединение установлено.")
        print("Выводимые сообщения: ")

        while True:
            line = ser.readline().decode().strip()

            if line:
                print("Полученная строка:", line)

    except KeyboardInterrupt:
        print('Цикл передачи прерван.')
        pass

    except serial.SerialException as se:
        print("Ошибка последовательного порта:", str(se))

    finally:
        if ser.is_open:
            ser.close()
            print("Последовательное соединение прервано.")


def mainProc():
    baudrate = 9600
    try:
        ports = serial.tools.list_ports.comports()
        portPointer = next((p.device for p in ports), None)
        if portPointer is None:
            raise ValueError("No COM port found.")
        else:
            for port in ports:
                print(port.device)

        currPort = input("Введите имя порта для взаимодействия: ")
        ser = serial.Serial(currPort, baudrate=baudrate, bytesize=8, parity='N', stopbits=1, timeout=1, xonxoff=False,
                            rtscts=False)

        match input("Введите 1, чтобы считать информацию из порта. Введите 2, чтобы послать информацию в порт.Введите "
                    "любую другую строку, чтобы выйти: "):

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