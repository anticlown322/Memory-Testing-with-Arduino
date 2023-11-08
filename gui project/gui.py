import customtkinter
import tkinter
from gui_engine import find_available_ports

# consts start #
software_version = "v1.0"


# consts end #


# App class start #
class App(customtkinter.CTk):
    def __init__(self):
        super().__init__()

# App class end #


# app configs start #
customtkinter.set_appearance_mode("system")
customtkinter.set_default_color_theme("green")

app = App()
app.title(f"Обработчик сообщений {software_version}")
w = app.winfo_screenwidth() // 2 - 400
h = app.winfo_screenheight() // 2 - 310
app.geometry(f"800x620+{w}+{h}")
app.resizable(False, False)
app.iconbitmap("images/circuit.ico")

my_font_normal = customtkinter.CTkFont(family="JetBrains Mono", size=14, weight="normal")
my_font_bold = customtkinter.CTkFont(family="JetBrains Mono", size=14, weight="bold")
# app configs end #


# funcs and procs start #


def button_check_ports_click():
    ports = find_available_ports()
    ports_names = []
    for port in ports:
        ports_names.append(port.name)
    ports_names.append('None')
    combobox_port_name.configure(values=ports_names)


def button_config_port_click():
    print("")


def button_specialized_input_click():
    print("")


def button_get_info_click():
    if button_get_info.cget("text") == "Получить информацию":
        button_get_info.configure(text="Закончить получать информацию")
        tabView.configure(state="disabled")
    else:
        button_get_info.configure(text="Получить информацию")
        tabView.configure(state="normal")


def button_send_info_click():
    if button_send_info.cget("text") == "Послать информацию":
        button_send_info.configure(text="Закончить посылать информацию")
        tabView.configure(state="disabled")
    else:
        button_send_info.configure(text="Послать информацию")
        tabView.configure(state="normal")


def combobox_callback():
    print("")

# funcs and procs end #


# panels config start #


#       buttons frame start         #
buttons_frame = customtkinter.CTkFrame(master=app,
                                       width=200,
                                       height=200,
                                       corner_radius=10)
buttons_frame.place(x=10, y=10)

buttons_label = customtkinter.CTkLabel(master=buttons_frame,
                                       text="Действия",
                                       width=120,
                                       height=25,
                                       corner_radius=8,
                                       font=my_font_bold)
buttons_label.place(relx=0.5, y=15, anchor=tkinter.CENTER)

button_check_ports = customtkinter.CTkButton(master=buttons_frame,
                                             text="Обновить",
                                             font=my_font_normal,
                                             command=button_check_ports_click)
button_check_ports.place(relx=0.5, y=45, anchor=tkinter.CENTER)

button_config_port = customtkinter.CTkButton(master=buttons_frame,
                                             text="Настроить",
                                             font=my_font_normal,
                                             command=button_config_port_click())
button_config_port.place(relx=0.5, y=85, anchor=tkinter.CENTER)

button_specialized_input = customtkinter.CTkButton(master=buttons_frame,
                                                   text="Спец.ввод",
                                                   font=my_font_normal,
                                                   command=button_specialized_input_click())
button_specialized_input.place(relx=0.5, y=125, anchor=tkinter.CENTER)
#       buttons frame end           #


#       status frame start         #
port_status_frame = customtkinter.CTkFrame(master=app,
                                           width=200,
                                           height=390,
                                           corner_radius=10)
port_status_frame.place(x=10, y=220)

label_frame_name = customtkinter.CTkLabel(master=port_status_frame,
                                          text="Состояние порта",
                                          width=120,
                                          height=25,
                                          corner_radius=8,
                                          font=my_font_bold)
label_frame_name.place(relx=0.5, rely=0.06, anchor=tkinter.CENTER)

label_port_name = customtkinter.CTkLabel(master=port_status_frame,
                                         text="Имя порта: ",
                                         font=my_font_normal,
                                         justify="left")
label_port_name.place(x=5, y=40)

option_menu_var = customtkinter.StringVar(value="Нет")
combobox_port_name = customtkinter.CTkComboBox(master=port_status_frame,
                                               width=100,
                                               values=[],
                                               variable=option_menu_var,
                                               state="readonly")
combobox_port_name.place(x=90, y=40)

label_is_port_open = customtkinter.CTkLabel(master=port_status_frame,
                                            text="Доступ к порту: ",
                                            font=my_font_normal,
                                            justify="left")
label_is_port_open.place(x=5, y=70)

label_port_configs = customtkinter.CTkLabel(master=port_status_frame,
                                            text="Настройки порта",
                                            font=my_font_bold)
label_port_configs.place(relx=0.5, y=115, anchor=tkinter.CENTER)

label_baudrate = customtkinter.CTkLabel(master=port_status_frame,
                                        text="Скорость: ",
                                        font=my_font_normal,
                                        justify="left")
label_baudrate.place(x=5, y=130)

label_byte_size = customtkinter.CTkLabel(master=port_status_frame,
                                         text="Размер байта: ",
                                         font=my_font_normal,
                                         justify="left")
label_byte_size.place(x=5, y=160)

label_parity_bit = customtkinter.CTkLabel(master=port_status_frame,
                                          text="Бит четности: ",
                                          font=my_font_normal,
                                          justify="left")
label_parity_bit.place(x=5, y=190)

label_stop_bits = customtkinter.CTkLabel(master=port_status_frame,
                                         text="Стоп-биты: ",
                                         font=my_font_normal,
                                         justify="left")
label_stop_bits.place(x=5, y=220)
#       status frame end            #


#       console frame start        #
port_console_frame = customtkinter.CTkFrame(master=app,
                                            width=570,
                                            height=600,
                                            corner_radius=10)
port_console_frame.place(x=220, y=10)

tabView = customtkinter.CTkTabview(port_console_frame,
                                   width=550,
                                   height=580)
tabView.place(x=10, y=10)
tabView.add("Ввод")
tabView.add("Вывод")

button_get_info = customtkinter.CTkButton(master=tabView.tab("Вывод"),
                                          text="Получить информацию",
                                          font=my_font_bold,
                                          command=button_get_info_click)
button_get_info.place(relx=0.5, rely=0.05, anchor=tkinter.CENTER)

button_send_info = customtkinter.CTkButton(master=tabView.tab("Ввод"),
                                           text="Послать информацию",
                                           font=my_font_bold,
                                           command=button_send_info_click)
button_send_info.place(relx=0.5, rely=0.05, anchor=tkinter.CENTER)

#               textBoxes config start              #
textbox_input = customtkinter.CTkTextbox(tabView.tab("Ввод"),
                                         width=530,
                                         height=550)
textbox_input.place(x=5, rely=0.1)
welcome_text = " > Введите команду"
textbox_input.insert("0.0", welcome_text)

textbox_output = customtkinter.CTkTextbox(tabView.tab("Вывод"),
                                          width=530,
                                          height=550)
textbox_output.place(x=5, rely=0.1)
textbox_output.configure(state="normal")
#               textBoxes config end                   #

#       console config end          #

# panels config end #

app.mainloop()
