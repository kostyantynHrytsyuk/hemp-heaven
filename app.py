########################################################################################################################
# Imports

from flask import Flask, render_template, request, redirect, url_for
from flask_wtf import FlaskForm
from wtforms import StringField,SubmitField
from wtforms.validators import InputRequired
import modules.queries as Queries


########################################################################################################################
# Form classes for select queries

class SelectForm1(FlaskForm):
    aid = StringField('Agronomist ID', validators=[InputRequired()])
    n = StringField('N', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.aid.data and self.n.data and self.fdate.data and self.sdate.data


class SelectForm2(FlaskForm):
    n = StringField('N', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.n.data and self.fdate.data and self.sdate.data


class SelectForm3(FlaskForm):
    cid = StringField('Customer ID', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.cid.data and self.fdate.data and self.sdate.data


class SelectForm4(FlaskForm):
    aid = StringField('Agronomist ID', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.aid.data and self.fdate.data and self.sdate.data


class SelectForm5(FlaskForm):
    aid = StringField('Agronomist ID', validators=[InputRequired()])
    cid = StringField('Customer ID', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.aid.data and self.cid.data and self.fdate.data and self.sdate.data


########################################################################################################################
# Form classes for event queries

class EventForm1(FlaskForm):
    aid = StringField('Agronomist ID', validators=[InputRequired()])
    hemp_sort_id = StringField('Hemp Sort ID', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.aid.data and self.hemp_sort_id.data and self.fdate.data and self.sdate.data


class EventForm2(FlaskForm):
    tasting_group_id = StringField('Tasting Group ID', validators=[InputRequired()])
    product_id = StringField('Product ID', validators=[InputRequired()])
    tasting_date = StringField('Tasting Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.tasting_date.data and self.tasting_group_id.data and self.product_id.data


class EventForm3(FlaskForm):
    aid = StringField('Agronomist ID', validators=[InputRequired()])
    cid = StringField('Agronomist ID', validators=[InputRequired()])
    order_date = StringField('Order Date', validators=[InputRequired()])
    product_ids = StringField('Product IDs', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.aid.data and self.cid.data and self.order_date.data and self.product_ids.data


class EventForm4(FlaskForm):
    order_id = StringField('Order ID', validators=[InputRequired()])
    return_date = StringField('Return Date', validators=[InputRequired()])
    status_id = StringField('Status ID', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.order_id.data and self.return_date.data and self.status_id.data


class EventForm5(FlaskForm):
    bsns_trip_group_id = StringField('Business Trip Group ID', validators=[InputRequired()])
    fdate = StringField('Start Date', validators=[InputRequired()])
    sdate = StringField('End Date', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.bsns_trip_group_id.data and self.fdate.data and self.sdate.data


class EventForm6(FlaskForm):
    cid = StringField('Customer ID', validators=[InputRequired()])
    return_date = StringField('Return Date', validators=[InputRequired()])
    text = StringField('Complaint/Proposition Text', validators=[InputRequired()])
    submit = SubmitField('Submit Query')

    def validate_on_submit(self):
        return self.submit.data and self.cid.data and self.return_date.data and self.text.data


########################################################################################################################
# The app and its necessary variables

app = Flask(__name__)
engine = Queries.create_engn('postgres', 'student', 'localhost', 'kannabis')
result = None
app.config['SECRET_KEY'] = 'My name is Yoshikage Kira. I\'m 33 years old. My house is in the northeast section of ' \
                           'Morioh, where all the villas are, and I am not married. I work as an employee for the ' \
                           'Kame Yu department stores, and I get home every day by 8 PM at the latest. I don\'t ' \
                           'smoke, but I occasionally drink. I\'m in bed by 11 PM, and make sure I get eight hours ' \
                           'of sleep, no matter what. After having a glass of warm milk and doing about twenty ' \
                           'minutes of stretches before going to bed, I usually have no problems sleeping until ' \
                           'morning. Just like a baby, I wake up without any fatigue or stress in the morning. I ' \
                           'was told there were no issues at my last check-up. I\'m trying to explain that I\'m a ' \
                           'person who wishes to live a very quiet life. I take care not to trouble myself with any ' \
                           'enemies, like winning and losing, that would cause me to lose sleep at night. That is ' \
                           'how I deal with society, and I know that is what brings me happiness. Although, if I ' \
                           'were to fight I wouldn\'t lose to anyone.'


@app.route('/')
def home():
    return render_template("index.html")


@app.route('/about')
def about_page():
    return render_template("about.html")



# -------------------------------------------------------------------------------------------------------------------- #


@app.route('/agronomist')
def agronomist_data():
    return render_template("agronomist.html")

@app.route('/agronomist1', methods=['GET', 'POST'])
def agronomist_data1():
    global engine
    global result

    form1 = SelectForm1()

    if form1.validate_on_submit():
        print("here1")
        result = Queries.make_select1(engine, form1.aid.data, form1.n.data, form1.fdate.data, form1.sdate.data)
        return redirect(url_for("query_result"))

    return render_template("agro1.html", form1=form1)


@app.route('/agronomist2', methods=['GET', 'POST'])
def agronomist_data2():
    global engine
    global result

    form2 = SelectForm4()

    if form2.validate_on_submit():
        print("here2")
        result = Queries.make_select4(engine, form2.aid.data, form2.fdate.data, form2.sdate.data)
        return redirect(url_for("query_result"))

    return render_template("agro2.html", form2=form2)



@app.route('/agronomist3', methods=['GET', 'POST'])
def agronomist_data3():
    global engine
    global result

    form3 = SelectForm2()

    if form3.validate_on_submit():
        result = Queries.make_select7(engine, form3.n.data, form3.fdate.data, form3.sdate.data)
        return redirect(url_for("query_result"))

    return render_template("agro3.html", form3=form3)


@app.route('/agronomist4', methods=['GET', 'POST'])
def agronomist_data4():
    global engine
    global result

    form4 = SelectForm5()

    if form4.validate_on_submit():
        result = Queries.make_select8(engine, form4.cid.data, form4.aid.data, form4.fdate.data, form4.sdate.data)
        return redirect(url_for("query_result"))

    return render_template("agro4.html", form4=form4)


@app.route('/agronomist5', methods=['GET', 'POST'])
def agronomist_data5():
    global engine
    global result

    form5 = SelectForm1()

    if form5.validate_on_submit():
        result = Queries.make_select9(engine, form5.aid.data, form5.n.data, form5.fdate.data, form5.sdate.data)
        return redirect(url_for("query_result"))

    return render_template("agro5.html", form5=form5)


@app.route('/agronomiste1', methods=['GET', 'POST'])
def agronomist_datae1():
    global engine
    global result

    formE1 = EventForm2()

    if formE1.validate_on_submit():
        Queries.event_make_tasting(formE1.tasting_group_id.data, formE1.product_id.data, formE1.tasting_date.data)
        return redirect(url_for("successful"))

    return render_template("agroe1.html", formE1=formE1)


@app.route('/agronomiste2', methods=['GET', 'POST'])
def agronomist_datae2():
    global engine
    global result

    formE2 = EventForm5()

    if formE2.validate_on_submit():
        Queries.event_make_business_trips(formE2.bsns_trip_group_id.data, formE2.fdate.data, formE2.sdate.data)
        return redirect(url_for("successful"))

    return render_template("agroe2.html", formE2=formE2)


# -------------------------------------------------------------------------------------------------------------------- #



@app.route('/customer')
def customer_data():
    return render_template("customer.html")


@app.route('/customer1', methods=['GET', 'POST'])
def customer_data1():
    global engine
    global result

    form1 = SelectForm3()
    return render_template("customer.html", form1=form1)


@app.route('/customer2', methods=['GET', 'POST'])
def customer_data2():
    global engine
    global result

    form2 = SelectForm1()
    return render_template("customer.html", form2=form2)


@app.route('/customer3', methods=['GET', 'POST'])
def customer_data3():
    global engine
    global result

    form3 = SelectForm3()
    return render_template("customer.html", form3=form3)


@app.route('/customer4', methods=['GET', 'POST'])
def customer_data4():
    global engine
    global result

    form4 = SelectForm2()
    return render_template("customer.html", form4=form4)


@app.route('/customer5', methods=['GET', 'POST'])
def customer_data5():
    global engine
    global result

    form5 = SelectForm3()
    return render_template("customer.html", form5=form5)


@app.route('/customere1', methods=['GET', 'POST'])
def customer_datae1():
    global engine
    global result

    formE1 = EventForm3()
    return render_template("customer.html", formE1=formE1)


@app.route('/customere2', methods=['GET', 'POST'])
def customer_datae2():
    global engine
    global result

    formE2 = EventForm4()
    return render_template("customer.html", formE2=formE2)


@app.route('/customere3', methods=['GET', 'POST'])
def customer_datae3():
    global engine
    global result

    formE3 = EventForm6()
    return render_template("customer.html", formE3=formE3)


# -------------------------------------------------------------------------------------------------------------------- #




@app.route('/crops')
def crops_data():
    return render_template("crops.html")


@app.route('/crops1', methods=['GET', 'POST'])
def crops_data1():
    global engine
    global result

    form1 = SelectForm2()
    return render_template("crops1.html", form1=form1)


@app.route('/crops2', methods=['GET', 'POST'])
def crops_data2():
    global engine
    global result

    form2 = SelectForm2()
    return render_template("crops2.html", form2=form2)


@app.route('/cropse1', methods=['GET', 'POST'])
def crops_datae1():
    global engine
    global result

    formE1 = EventForm1()
    return render_template("cropse1.html", formE1=formE1)




# -------------------------------------------------------------------------------------------------------------------- #

@app.route('/result')
def query_result():
    global result

    return render_template("query-result.html", data=result)

@app.route('/success')
def successful():
    return render_template("success.html")

########################################################################################################################
# Run the app

if __name__ == '__main__':
    app.run()


########################################################################################################################
