import re

# Đọc file SQL gốc
with open("../sample/devices.sql", "r", encoding="utf-8") as file:
    sql_data = file.read()

# Regex để tìm ngày có định dạng mm-dd-yyyy hoặc d-m-yyyy
# và thay thế thành STR_TO_DATE với định dạng yyyy-mm-dd
updated_data = re.sub(
    r"(\d{1,2})-(\d{1,2})-(\d{4})",
    lambda m: f"{int(m.group(3)):04d}-{int(m.group(1)):02d}-{int(m.group(2)):02d}",
    sql_data,
)

# Ghi kết quả vào file mới
with open("../sample/temp_devices.sql", "w", encoding="utf-8") as file:
    file.write(updated_data)

print("Đã thay đổi định dạng ngày và thêm STR_TO_DATE vào file mới")
