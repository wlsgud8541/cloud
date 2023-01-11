package com.project.cloud.main.dao;

import java.util.ArrayList;

public interface MainDao {
	//반환 타입은 필요한 타입에 맞게 수정해서 사용
	public ArrayList<?> selectMainList();
}
