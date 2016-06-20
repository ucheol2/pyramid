# User Searching for Network Marketing DB
**DB Query를 활용해서 검색 및 필터 시스템을 만들어보자**

## 1. Given
**1. 예쁘은 HTML 뷰파일**

* User 데이터들을 `<table>`태그를 이용하여 출력한다, Pagination 기능은 덤 (will_paginate 사용).
* `<input>`태그만 추가하면 되는 완벽한 `<form>`태그가 이미 작성되어 있다.

**2. 완벽한 controller와 action**

* 서비스를 돌리기 위해서는 User Controller에 index Action 하나면 충분하다!

**3. 풍부한 User Model**

* User model은 다음과 같은 attributes를 가지고 있다.

```
name:string
grade:string
email:string
university:string
gender:string
birthday:datetime
performance:integer
married:boolean
```

* `rake db:seed`를 실행하면 1000개의 User 데이터가 생성된다 (Faker gem 사용).

**4. 쌈박한 Ajax 기능**

* 번거로운 javascript를 사용하지 않는 Rails의 강려크한 기능을 활용함.
* 주어진 코드 중 이해하기 어려운 부분이 존재하는데, 곧 다룰 예정이니 지금은 예고편 정도로 생각하자.

## 2. ToDo
***Super Important Rule***

**이번 실습에서 backend는 `app/models/user.rb`안의 `search` method 내부만을 수정하면 됩니다. 다른 *"모든"*부분은 건드릴 필요가 전혀 없습니다.**

* Backend 부분

```ruby
class User < ActiveRecord::Base

  # U should complete this function 'search'
  # Let's query User data!
  def self.search
    all 
  end 

end
```

1. 위 `search` method를 완성하자.
2. `search` method는 다양한 parameters를 입력값으로 받도록 수정한다.
3. 함수의 실행 결과값은 query를 실행한 User model이어야 한다. 즉, Array등의 형태가 아닌 User model class(ActiveRecord)이어야 한다. 안그러면 에러가 날걸요??

* Frontend 부분

	* app/views/users/index.html.erb

```html
<%= form_tag users_path, class: 'col s12', method: :get, remote: true do %>
	<!--
	U shold add more input tags to submit various parameters
	Make it yourself!
	-->
  	<div class="input-field">
   		<input type="text" name="name" id="name">
    	<label for="name">name</label>
	</div>

  	<div class="right">
    	<button class="btn waves-effect waves-light" type="submit" name="action">Search</button>
  	</div>
<% end %>
```

1. `form_tag` 핼퍼 안에 원하는대로 `input`태그 등을 추가하여 자신만의 검색 `form`을 만들어 봅시다. 평소 `HTML` 태그 쓰던대로 내부를 구성하면 됩니다.

	* app/views/users/index.js.erb

```javascript
// Add more parameters by get method
// Example) window.history.pushState('','','/?query1=value1&query2=value2&query3=value3')
window.history.pushState('','','/?name=<%= params[:name] %>');
```

1. 필수는 아님, 위 코드를 수정하여 여러분이 추가한 parameter를 get 방식으로 저장할 수 있게 만들면 pagination이 보다 완벽하게 동작합니다.
2. 뭔 소린지 못알아 먹겠으면 가까운 운영진에게 물어봅시다.