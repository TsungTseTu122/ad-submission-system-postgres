-- Clients
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('彥廷', '李', 'Male', 0922863065, '1975-09-04', '758 北竿縣龍山寺巷7號之1') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('郁雯', '陳', 'Female', 0918949058, '1977-08-28', '438 桃園正義巷69號1樓') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('俊傑', '劉', 'Non-binary', 0954028250, '1974-03-12', '64271 北斗市忠孝巷56號7樓') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('郁婷', '蕭', 'Prefer not to say', 0972386669, '1996-04-19', '782 大里勝利街991號之8') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('佳慧', '吳', 'Prefer not to say', 0986107560, '1969-09-26', '621 臺東市水源巷347號4樓') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('俊宏', '高', 'Prefer not to say', 0979718589, '1968-04-01', '993 雲林市紅樹林路2段317號之9') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('怡婷', '萬', 'Non-binary', 0985156946, '1987-05-31', '568 平鎮市信義街512號1樓') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('怡萱', '易', 'Prefer not to say', 0929053004, '1978-05-23', '67184 屏東四維巷5段84號之0') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('佳穎', '胡', 'Prefer not to say', 0962628928, '2003-05-23', '42599 汐止縣府中路3號之3') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('怡如', '黃', 'Male', 0965608907, '1997-10-08', '752 竹北縣成功巷85號2樓') ON CONFLICT DO NOTHING;

-- Departments
INSERT INTO department (name, location, telephone_number)
        VALUES ('Dept_1', '1F', '04-3469767')
        ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number)
        VALUES ('Dept_2', '2F', '03-3389667')
        ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number)
        VALUES ('Dept_3', '3F', '04-4539974')
        ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number)
        VALUES ('Dept_4', '4F', '07-9444717')
        ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number)
        VALUES ('Dept_5', '5F', '03-2732470')
        ON CONFLICT DO NOTHING;

-- Staff
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000001', 'Prefer not to say', '1966-01-31', '32741 桃園市象山巷9號之4', '0993465644',
            '惠雯', '石', 1, '2021-09-24', 'Manager'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000002', 'Non-binary', '1963-02-02', '53477 新營劍南路92號之1', '0915461381',
            '雅琪', '郭', 1, '2022-08-09', 'Coordinator'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000003', 'Female', '1979-08-14', '85041 八德育英巷491號之4', '0914089747',
            '馨儀', '彭', 2, '2020-06-05', 'Manager'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000004', 'Female', '2001-01-26', '234 高雄關渡街765號2樓', '0946703924',
            '庭瑋', '邱', 2, '2022-09-19', 'Analyst'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000005', 'Male', '1960-08-25', '91635 白沙迴龍巷95號之1', '0954078340',
            '俊賢', '黃', 3, '2020-10-24', 'Specialist'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000006', 'Prefer not to say', '1980-01-02', '82041 三重縣西門巷762號之5', '0914491475',
            '美琪', '彭', 3, '2024-01-10', 'Intern'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000007', 'Male', '1990-08-16', '117 汐止市奇岩巷7段23號3樓', '0951177576',
            '雅琪', '段', 4, '2020-04-26', 'Manager'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000008', 'Female', '1998-10-09', '703 台北文山路42號8樓', '0999806776',
            '雅慧', '張', 4, '2025-01-07', 'Coordinator'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000009', 'Female', '2002-07-01', '34983 橫山市正義路8段943號之0', '0947246013',
            '怡安', '吳', 5, '2022-01-04', 'Specialist'
        ) ON CONFLICT DO NOTHING;
INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '000000010', 'Prefer not to say', '1980-08-17', '86363 頭份縣興街15號6樓', '0939061858',
            '淑芬', '史', 3, '2024-03-10', 'Analyst'
        ) ON CONFLICT DO NOTHING;

-- Staff Credentials
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000001', 'user0', 'dfc0d079c6cdc1d7d2ee3e0ca85cb31df94fb2caba205a0b5ecf8b02d401eccb') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000002', 'user1', '6f22e8469c481a3801282f6c78ea3df0a7cff36db0bb1a169958ab40ac4af382') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000003', 'user2', 'a52a4fafe9c69e8db3c33d996210169cb69ccd214e3160fda4c7530d798420fe') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000004', 'user3', '9221bbe611e2ea6ccc52b2815daf2143e67ec9c624150e47688dc865ca2559fe') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000005', 'user4', '0c1a1bf2727a78ee5d078e16e495748916ff6e886cb1df3122a34337d8800ac0') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000006', 'user5', '410e4923d72796e932d8936c874ccbadeafc04bfded1a074a432467feed5ad94') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000007', 'user6', 'dbd274ae34b8be950fe23ba1128eca99653a393033de12b5eab6055689e5cb4f') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000008', 'user7', 'ef2e98725614ae9a76f1fc1d7859672af11af3218646d1148ff315f04d095b91') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000009', 'user8', '197dd1bff5e09ef15d110667627113b68fa5fb41adcffd15aef8a658af5a8769') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('000000010', 'user9', '8bf551e3278f36c535c825eb2ac380b202461230322b3060c30a791f485e2708') ON CONFLICT DO NOTHING;

-- Client Credentials
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (1, 'client1', '5521c4e2649e3f93bc2d7b9801aa3ed7d0470a0e750a8d290a7bd415777e1ef7') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (2, 'client2', 'ffdbb65faf29d19c1b9ce77749e635e390677bae5482193cf4b137312c641d7b') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (3, 'client3', '6055db9810bd9bf9082b524cf28bfee14e9ff86d81623550133cff5b084476e7') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (4, 'client4', 'c3c9af352c96111a7203e0bc8190ed00a9f526c9c4bcae69739e6a79eef2f36c') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (5, 'client5', 'a1cae62f8299ef43ea32d6b927716b9793d1a357969586497414b1d90000adc4') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (6, 'client6', '98da423879d95f786dcac9e294c149b1c670ff8a1093c1fc7e23f69862e64d9f') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (7, 'client7', 'c9f739e6d3008158391f845c0800f8b7dec3d5cb7df009b32bd311eec60f8dfa') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (8, 'client8', '44cf5d438d78673ad04f88366d0f9f8e2fcfc2505dea077dcb898a3d0dc87034') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (9, 'client9', '2902780d80f506f3aed7d61f5ec326b00d98b2aaf2e1c1fb1062110c3d86d790') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (10, 'client10', '950700f928c82a17c82954a6a83eb218364ad4b84443b7de545ce006a2716ec6') ON CONFLICT DO NOTHING;

-- Requests
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-03-22', 28107, 'Approved', '不過密碼世界.實現網上正在應用美國.今天她的擁有客戶如何認為以下.
合作系列提高.一下而且今年處理可能還有工程銷售.自己圖片技術沒有產品感覺這是.', 7) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-10-02', 17946, 'Rejected', '起來單位分析你們出來知道.是一閱讀資源出來運行顯示次數.新聞都是開始表示部分.
選擇企業軟體歡迎系統系列密碼.以及社區注意出現回復隻有專業.
由於很多如何圖片.不同不能簡介地方關系.', 10) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-01-21', 5239, 'Rejected', '教育首頁精華比較專業國內經驗.情況合作美國生產根據全國.
根據帖子決定加入孩子需要威望.雖然她的台灣是否個人不同那個.自己應該感覺他的.', 6) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-05-27', 45047, 'Rejected', '能力得到生活投資需要基本人員.學校這裡注意知道電子質量留言選擇.之后選擇狀態手機國內電影為什工具.
系列查看特別一直的話.為了過程對於關於銷售幫助.是一以下我的更多.', 10) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-12-26', 25957, 'Pending', '包括方式無法比較經營認為.謝謝地區規定成為人員.
就是地區一直游戲.項目進行台灣開始.地址比較雖然台北這是.
質量一些參加文章不同.一下沒有今年幫助部門.一直目前功能說明台北.', 2) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-06-30', 29930, 'Rejected', '運行文件網絡台灣增加關於.使用手機解決成功位置.
台灣重要中心軟體資源企業.
密碼安全學習能力不過也是.發現說明人民美國.地方不能主題地區操作威望.', 7) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-04-02', 9309, 'Pending', '如何公司下載評論用戶上海.電話一切學校項目可是.
手機以上不斷自己感覺經驗目前學校.大家單位她的以后程序.
運行能夠日本如何一下銷售.處理這種文章工程經驗產品.處理個人加入搜索一點.', 6) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-10-12', 33340, 'Pending', '留言有關其實內容規定.我們部分還有注意帖子.
其中社區品牌以上.為了投資之后繼續這是然后.增加積分運行可以的人.根據你的學習發生不過台北.
一下要求以后隻有點擊.男人人民之間位置.', 1) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-01-13', 26624, 'Approved', '活動一些運行公司有限.操作不是起來生產我的.
同時空間其他文章責任.瀏覽經濟制作管理可能軟體為了.
然后活動就是銷售.日本一直由於電腦工作這是.閱讀工作合作深圳.部門由於的是說明行業公司准備.', 4) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-03-18', 41817, 'Approved', '方法個人處理或者國際一下.網站說明方法過程國內注冊主題.質量那麼密碼開發您的.
中文那麼安全數據通過如此出現.孩子標准經營組織來自.圖片來自責任社區比較標題.', 8) ON CONFLICT DO NOTHING;

-- Projects
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-07-02', 'Not Started', 42317, '有關正在一般完成深圳不是選擇.', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-10-12', 'Completed', 12576, '大家語言關系大學.', 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-09-16', 'Completed', 30841, '沒有游戲一種兩個國家.', 3, 5) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-10-12', 'In Progress', 15849, '當前投資搜索聯系而且網站.', 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-09-02', 'Not Started', 77857, '市場市場那些密碼你們規定方面.', 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-06-12', 'Completed', 97895, '內容開發結果類別來源進行然后.', 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-06-29', 'Completed', 68678, '這樣一些如果已經計劃也是目前汽車.', 7, 5) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-10-08', 'Completed', 49484, '規定發生地址上海.', 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-08-30', 'In Progress', 70623, '不會對於謝謝其中企業要求.', 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-25', '2025-09-26', 'Not Started', 11706, '閱讀發生中心已經.', 10, 2) ON CONFLICT DO NOTHING;

-- Payroll Records

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000001', 36051, 5725, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000002', 30449, 2211, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000003', 38868, 5535, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000004', 42354, 2813, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000005', 49139, 4388, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000006', 54001, 1087, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000007', 61768, 2778, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000008', 65850, 6082, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000009', 67414, 7039, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('000000010', 30810, 2961, '2025-04-25')
            ON CONFLICT DO NOTHING;
        

-- Employment Types (Full-Time / Part-Time / Internship)
INSERT INTO internship (ssn, experience) VALUES ('000000001', '安心服務員') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000002', '多媒體動畫設計師') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000003', '門市／店員／專櫃人員') ON CONFLICT DO NOTHING;
INSERT INTO internship (ssn, experience) VALUES ('000000004', '資訊助理人員') ON CONFLICT DO NOTHING;
INSERT INTO internship (ssn, experience) VALUES ('000000005', '記帳／出納／一般會計') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000006', '計程車司機') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000007', '機械設計／繪圖人員') ON CONFLICT DO NOTHING;
INSERT INTO internship (ssn, experience) VALUES ('000000008', '股務人員') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000009', '專案管理師') ON CONFLICT DO NOTHING;
INSERT INTO part_time (ssn, experience) VALUES ('000000010', '採購主管') ON CONFLICT DO NOTHING;

-- Assignments
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (1, '000000007', '2024-12-06') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (8, '000000009', '2025-02-20') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (3, '000000010', '2024-12-13') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (3, '000000001', '2024-07-29') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (10, '000000006', '2025-01-11') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (4, '000000010', '2024-07-10') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (6, '000000008', '2024-10-07') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (6, '000000007', '2025-04-22') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (2, '000000005', '2025-03-06') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (1, '000000007', '2025-01-04') ON CONFLICT DO NOTHING;