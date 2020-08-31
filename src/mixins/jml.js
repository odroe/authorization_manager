const link = 'https://bn0ywt.jgmlink.cn/AA12';

function jmlHandler(config) {
    new window.JMLink(config);
}

export const useJMLinkMethodMixin = {
    computed: {
        jml: () => ([]),
    },
    mounted() {
        const names = this.jml;
        let elements = [];
        if (typeof names == 'string') {
            const { [names]: element } = this.$refs;
            if (element instanceof Element) {
                elements.push({
                    jmlink: link,
                    button: element,
                });
            }
        } else if (Array.isArray(names) == false) {
            throw '处理对象必须传入字符串或者数组';
        }

        for (const name of names) {
            const { [name]: element } = this.$refs;
            if (element instanceof Element) {
                elements.push({
                    jmlink: link,
                    button: element,
                });
            }
        }

        jmlHandler(elements);
    }
};