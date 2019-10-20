package com.hotel.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class ImageVO {
	private Integer error=0;// 0表示成功,1表示失败
	private String url;	//图片的虚拟路径
	private Integer height;	//图片的高度
	private Integer width;	//图片的宽度
	
	//指定失败方法
	public static ImageVO fail() {
		return new ImageVO(1, null, null, null);
	}
}
