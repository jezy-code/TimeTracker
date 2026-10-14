from flask import Flask, jsonify, request, send_from_directory
import sqlite3

app = Flask(__name__, static_folder='.')

def get_db_connection():
    conn = sqlite3.connect('timetracker.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return send_from_directory('.', 'dashboard.html')

# API: Get companies for dropdown
@app.route('/api/companies')
def get_companies():
    conn = get_db_connection()
    companies = conn.execute('SELECT company_name FROM companies ORDER BY company_name').fetchall()
    conn.close()
    return jsonify([dict(row) for row in companies])

# API: Get personnel filtered by company
@app.route('/api/personnel')
def get_personnel():
    company_name = request.args.get('company')
    conn = get_db_connection()
    personnel = conn.execute(
        '''SELECT status, staff_id, title, staff_name, post, start_date, resigned_date, trained_date, remarks 
           FROM company_personnel WHERE company_name = ?''',
        (company_name,)
    ).fetchall()
    conn.close()
    return jsonify([dict(row) for row in personnel])

# API: Save Fault Log data to database
@app.route('/api/fault-logs', methods=['POST'])
def save_fault_log():
    data = request.json
    conn = get_db_connection()
    conn.execute(
        '''INSERT INTO fault_logs (fault_log_id, agency, date, time, taken_by, reported_by_tech, reported_by_clerk, remarks)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?)''',
        (
            data.get('fault_log_id'),
            data.get('agency'),
            data.get('date'),
            data.get('time'),
            data.get('taken_by'),
            data.get('reported_by_tech'),
            data.get('reported_by_clerk'),
            data.get('remarks')
        )
    )
    conn.commit()
    conn.close()
    return jsonify({"success": True, "message": "Fault log saved successfully!"})

if __name__ == '__main__':
    app.run(debug=True, port=5000)