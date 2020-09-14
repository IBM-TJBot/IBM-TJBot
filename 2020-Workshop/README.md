# 2020 TJBot Workshop in Viet Nam

[HUST SOICT Innovation Club ("Sinno")'s Guide](https://users.soict.hust.edu.vn/sinno/projects/tjbot)
- Về phần cứng, phía Viện CNTT đã thay đổi thiết kế khung vỏ ban đầu của TJbot cho phù hợp với phần bo mạch chủ mới Raspberry Pi 4. Bổ sung thêm nguồn DC chất lượng cao. Tất cả các yếu tố còn lại như các linh kiện điện tử đều giống như bộ TJbot do Sparkfun .
- Về phân mềm:
  - Trong mỗi bộ kit TJbot đều đính kèm 1 quyển hướng dẫn lắp ghép
  - Bên cạnh đó, còn có in cả URL tới bản hướng dẫn online, giúp các em học sinh có thông tin mới nhất
  - Hiện đã có các video quay quá trình lắp ráp. Ươc tính phải cỡ 30 phút mới ghép xong.
  - Đã có 1 bản đề cương về cách thức trình bày trong 1 buổi workshop tầm 3h. Có tham khảo theo 1 bài giảng online do chị Giang gợi ý.
  - Các bài lab có thể thực hiện trên 1 công cụ giả lập Tjbot online
  - Hoàn thành khoảng 40% một bài slide chi tiết giai thích về nguyên lý hoat động, ý nghĩa, và tác dụng của từng dòng code minh họa.
  - Đã tạo ra một OS image để burn lên trên SDcard cho robot hoạt động luôn. Lý do là thao tác cài đặt khá phức tạp, SV cũng toát mồ hôi 1 ngày mới xong. Các HD trên mạng ko giống lắm với thực tế.

TJBot's capabilities through Swift Playground on iPad:
- `.analyzeTone(text: String)`
- `.converse(workspaceId: String, message: String)`
- `.description`
- `.identifyLanguage(text: String)`
- `.listen(completion: ((String) -> Void))`
- `.lowerArm()`
- `.pulse(color: UIColor, duration: TimeInterval)`
- `.raiseArm()`
- `.read()`
- `.see()`
- `.shine(color: UIColor)`
- `.sleep(duration: TimeInterval)`
- `.speak(message: String)`
- `.translate(text: String, sourceLanguage: TJTranslationLanguage, targetLanguage: TJTranslationLanguage)`
- `.wave()`
