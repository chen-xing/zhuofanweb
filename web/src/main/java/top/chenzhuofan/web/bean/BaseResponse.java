package top.chenzhuofan.web.bean;

import lombok.Data;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年06月02日上午21:34]
 */
@Data
public class BaseResponse<T> {
    private Integer code;
    private boolean success;
    private T data;

    public BaseResponse(T data) {
        this.code = 0;
        this.success = true;
        this.data = data;
    }
}
