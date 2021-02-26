class QuestionEntity {
	String solution;
	List<QuestionEntityOption> options;
	String text;
	bool locked;

	QuestionEntity({this.solution, this.options, this.text, this.locked});

	QuestionEntity.fromJson(Map<String, dynamic> json) {
		solution = json['solution'];
		if (json['options'] != null) {
			options = new List<QuestionEntityOption>();(json['options'] as List).forEach((v) { options.add(new QuestionEntityOption.fromJson(v)); });
		}
		text = json['text'];
		locked = json['locked'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['solution'] = this.solution;
		if (this.options != null) {
      data['options'] =  this.options.map((v) => v.toJson()).toList();
    }
		data['text'] = this.text;
		data['locked'] = this.locked;
		return data;
	}
}

class QuestionEntityOption {
	String code;
	bool correct;
	String text;

	QuestionEntityOption({this.code, this.correct, this.text});

	QuestionEntityOption.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		correct = json['correct'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['correct'] = this.correct;
		data['text'] = this.text;
		return data;
	}
}
