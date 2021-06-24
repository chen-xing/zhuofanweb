package top.chenzhuofan.web.request;

import lombok.Data;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年10月26日上午14:08]
 */
@Data
public class GetNewsInfoRequest {
    private Integer pageSize;
    private Integer pageIndex;
}
